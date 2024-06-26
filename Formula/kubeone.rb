class Kubeone < Formula
  desc "Automates Kubernetes cluster operations on any cloud or edge infrastructure"
  homepage "https://docs.kubermatic.com/kubeone/v1.8"
  url "https://github.com/kubermatic/kubeone/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "d4279f0f49fee6db6e9ce8d88cf19d5411b69ad85f4ff4ac514b31a676a1c311"
  license "Apache-2.0"

  head "https://github.com/kubermatic/kubeone.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/embik/tap"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "73c8c31a1540cf7c87ba7ced03323ff58e79f1dd137b348e5f7e919564995b52"
  end

  depends_on "go" => :build
  depends_on "opentofu" => :optional
  depends_on "terraform" => :optional

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[
      -s -w
      -X k8c.io/kubeone/pkg/cmd.defaultKubeVersion=v1.29.5
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
