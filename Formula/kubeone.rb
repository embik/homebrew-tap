class Kubeone < Formula
  desc "Automates Kubernetes cluster operations on any cloud or edge infrastructure"
  homepage "https://docs.kubermatic.com/kubeone/v1.9"
  url "https://github.com/kubermatic/kubeone/archive/refs/tags/v1.9.1.tar.gz"
  sha256 "bd19d41be2a172b5ad280e29fe7aac6d1f6c8d10c42bc6a4655bc4bb72aab2af"
  license "Apache-2.0"

  head "https://github.com/kubermatic/kubeone.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/embik/tap"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ffc48ad428c18e93abeceb2d6783a17424dbef4a1b69e1f75b25da97632dc972"
  end

  depends_on "go" => :build
  depends_on "opentofu" => :optional
  depends_on "terraform" => :optional

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = %W[
      -s -w
      -X k8c.io/kubeone/pkg/cmd.defaultKubeVersion=v1.31.4
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
