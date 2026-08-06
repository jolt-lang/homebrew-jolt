class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.5/jolt-v0.6.5-aarch64-macos.tar.gz"
      sha256 "8f0a009dcfc70f7f305e6e63f338f2b9e61d11caa9b2a7de42d8e5ada2d9e88d"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.5/jolt-v0.6.5-x86_64-linux.tar.gz"
      sha256 "74b7eda6d1f9eeee0dbb44fb781721b134fd9fc058f56db274cf3c07dccd634d"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
