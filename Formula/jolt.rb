class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.10/joltc-v0.4.10-aarch64-macos.tar.gz"
      sha256 "e12fa55abafd77f9a6b30a1a0dfd033e016dfe353d14457bec2e3c1c6a985bfb"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.10/joltc-v0.4.10-x86_64-linux.tar.gz"
      sha256 "da17be440c40387e203dbc578d65a0fb9e21bc9ac1da4ed469006be27aff0b43"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
