class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.19/jolt-v0.5.19-aarch64-macos.tar.gz"
      sha256 "6a3c5481029ef30013f2de5412bd0e56b9d9b2f73cea425889e74196930fd522"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.19/jolt-v0.5.19-x86_64-linux.tar.gz"
      sha256 "b0440c03ee3916ca97cdeb76d4d093dbc1dcb74f3715cd2af3d64391ead454b1"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
