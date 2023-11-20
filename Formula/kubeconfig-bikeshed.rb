class KubeconfigBikeshed < Formula
  desc "Opinionated tool to manage your kubeconfigs"
  homepage "https://github.com/embik/kubeconfig-bikeshed"
  url "https://github.com/embik/kubeconfig-bikeshed/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b22729bd8fde18996ef01d7586654bfb08d139891f802c3d4f12712af6d8f589"
  license "Apache-2.0"

  depends_on "rust" => :build

  depends_on "openssl@3"

  depends_on "fzf" => :optional

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/kbs", "--help"
  end
end
