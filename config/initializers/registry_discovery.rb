app_name = 'anvisa'
discovery_url = "http://discovery:8761/eureka/apps/#{app_name}"
registry_data = {
    "instance": {
        "hostName": app_name,
        "app": app_name,
        "vipAddress": "com.automationrhapsody.eureka.app",
        "secureVipAddress": "com.automationrhapsody.eureka.app",
        "ipAddr": app_name,
        "status": "UP",
        "port": {"$": "3000", "@enabled": "true"},
        "securePort": {"$": "8443", "@enabled": "false"},
        "healthCheckUrl": "http://#{app_name}:3000/health",
        "statusPageUrl": "http://#{app_name}:3000/health",
        "homePageUrl": "http://#{app_name}:3000/",
        "dataCenterInfo": {
            "@class": "com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo",
            "name": "MyOwn"
        }
    }
}

discovery_uri = URI(discovery_url)
req = Net::HTTP::Post.new(discovery_uri, 'Content-Type' => 'application/json')
req.body = registry_data.to_json
resp = Net::HTTP.start(discovery_uri.hostname, discovery_uri.port) do |http|
  http.request(req)
end

if resp.code == '204'
  puts 'App registered at DISCOVERY (NETFLIX Eureka)'.colorize(:blue)
else
  puts "ERROR registering at DISCOVERY (NETFLIX Eureka): #{resp.code}".colorize(:red)
end