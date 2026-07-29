class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.11/jolt-v0.5.11-aarch64-macos.tar.gz"
      sha256 "cf3149e6fc552fcb133ff1e32a0059d0314f3e9c83054b91c97e3b97e72a3bd2"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.11/jolt-v0.5.11-x86_64-linux.tar.gz"
      sha256 "b426f890f5026eb6002a9795689d5d9b7ac2aa8d99f5fab81dae7ff38e5a6617"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
