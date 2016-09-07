require "./app"

run Rack::URLMap.new(
  "/" => Website.new
)
