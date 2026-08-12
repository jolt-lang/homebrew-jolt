class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.6/jolt-v0.7.6-aarch64-macos.tar.gz"
      sha256 "6dff8202b6045afb3a68136d7d9b43f72bfcacb3e62387545b6d8dbd7718404e"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.6/jolt-v0.7.6-x86_64-linux.tar.gz"
      sha256 "5e9cad8b9e50fe4f0397b1c07d90fb482ccabb7d872219f9a98b6a9c00ce3270"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
