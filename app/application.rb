class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last

      @@items.each do |i|
        puts "i = #{i}"
        if i.name == item
          puts "item found and price = #{i.price}"
          resp.write i.price
          resp.status = 200
        else
          puts "item #{item} was not found"
          resp.write "Item not found"
          resp.status = 400
        end
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
