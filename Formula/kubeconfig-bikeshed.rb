class KubeconfigBikeshed < Formula
  desc "Opinionated tool to manage your kubeconfigs"
  homepage "https://github.com/embik/kubeconfig-bikeshed"
  url "https://github.com/embik/kubeconfig-bikeshed/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d99d27bc476b19f762b8bbc321ea8ab43670520029c931139b32d4eed1e78b71"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/embik/tap"
    sha256 cellar: :any, ventura: "8c6c20d46a8bf3ff1f727214d5dfa4f938beb67444df71ffe37d2057891007e7"
  end

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
