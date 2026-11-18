cask "capturist-complete" do
  version "1.1.0,11"
  sha256 "b529f6c7ef13f13a4893036528183b7b0a8219ac036d7e6b5121346849a2637d"

  url "https://capturist.nodetools.org/download/CapturistComplete-#{version.csv.first}-#{version.csv.second}.dmg"
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
