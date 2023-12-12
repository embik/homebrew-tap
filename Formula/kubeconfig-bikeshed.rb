class KubeconfigBikeshed < Formula
  desc "Opinionated tool to manage your kubeconfigs"
  homepage "https://github.com/embik/kubeconfig-bikeshed"
  url "https://github.com/embik/kubeconfig-bikeshed/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a815acbf4217e0d61c9c69e059cb0e75e3e9ce87c8c5b2060f9c7d6846e452fc"
  license "Apache-2.0"

  head "https://github.com/embik/kubeconfig-bikeshed.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/embik/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, ventura: "9871c8268ca2f51b14d056d61d6b5b24e7ba98419b41c7f542f094717792cc7f"
  end

  depends_on "rust" => :build
  depends_on "fzf" => :optional

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/kbs", "--help"
  end
end
