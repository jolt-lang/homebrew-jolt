class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.14/jolt-v0.5.14-aarch64-macos.tar.gz"
      sha256 "f40c12867e83788706a182d43dcbbc77b3d6d0f04df1fcd04099ecde9101ec71"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.14/jolt-v0.5.14-x86_64-linux.tar.gz"
      sha256 "57f21cd31507c00364922b1e077994640373d66ffd623869f92b5da4184137c1"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
