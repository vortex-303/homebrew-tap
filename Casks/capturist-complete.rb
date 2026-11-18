cask "capturist-complete" do
  version "1.1.0,5"
  sha256 "24eac8d7aac3d093970b8c360a93e567bd68da2098b619ebf6fe6e7b71f97f33"

  url "https://capturist.nodetools.org/download/CapturistComplete.dmg"
  name "Capturist Complete"
  desc "Screenshot, snippet and clipboard library with on-device text search"
  homepage "https://capturist.nodetools.org/"

  livecheck do
    url "https://capturist.nodetools.org/capturist.json"
    strategy :json do |json|
      app = json.dig("app", "distribution", 0)
      "#{app["version"]},#{app["build"]}"
    end
  end

  depends_on macos: ">= :sonoma"

  app "Capturist Complete.app"

  zap trash: "~/Library/Containers/*.capturist.complete"
end
