class Kubeone < Formula
  desc "Automates Kubernetes cluster operations on any cloud or edge infrastructure"
  homepage "https://docs.kubermatic.com/kubeone/v1.8"
  url "https://github.com/kubermatic/kubeone/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "4e5a342720d67fb6103eea932475c83c0af5a8fda1ad7736017b4104f8d6098e"
  license "Apache-2.0"

  head "https://github.com/kubermatic/kubeone.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/embik/tap"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8f9e739ab07f83d5090075d70625b9d691fb3dc31a5ffb2904fd0251c6b62fc4"
  end

  depends_on "go" => :build
  depends_on "opentofu" => :optional
  depends_on "terraform" => :optional

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[
      -s -w
      -X k8c.io/kubeone/pkg/cmd.defaultKubeVersion=v1.30.3
      -X k8c.io/kubeone/pkg/cmd.version=v#{version}
      -X k8c.io/kubeone/pkg/cmd.date=#{time.iso8601}
    ]

    system "go", "build", *std_go_args(ldflags:), "."
    generate_completions_from_executable(bin/"kubeone", "completion", shells: [:bash, :zsh])
  end

  test do
    system "#{bin}/kubeone", "--help"
  end
end
