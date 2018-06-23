class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item}
      resp.write item.price
    else

      resp.write 400 Route not found
    end

    resp.finish
  end
end
