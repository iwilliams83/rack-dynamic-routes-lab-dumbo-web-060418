class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      item = Item.find_by(name: item)
        if @@items.include?(item)
          resp.write item.price
          resp.status = 200
        else
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
