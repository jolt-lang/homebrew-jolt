class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.22/jolt-v0.8.22-aarch64-macos.tar.gz"
      sha256 "a810a83ecab5365fc6358dabe8abddeb7f974394676fb7160364c75744b124af"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.22/jolt-v0.8.22-x86_64-linux.tar.gz"
      sha256 "b6aef5a73c8537cf7e5c4d51887511c275fde1a01ca9ac59a0f5200e606ccd0f"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
