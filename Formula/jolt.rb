class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.4/jolt-v0.5.4-aarch64-macos.tar.gz"
      sha256 "067892c9afeee5bc2d30718e1ba0a8e65e2bedd6a5f64fb61baec8a37cb2c374"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.4/jolt-v0.5.4-x86_64-linux.tar.gz"
      sha256 "e5b352df5c9a987ce7a09337b2676349f26fa74a87db72f5303d98d1b333e690"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
