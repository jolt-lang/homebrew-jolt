class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.5/joltc-v0.4.5-aarch64-macos.tar.gz"
      sha256 "d3e82c7eecb5c92e930a5c515c5f5fc6a0532521dc0412fd03066a1e3aaa1ad7"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.5/joltc-v0.4.5-x86_64-linux.tar.gz"
      sha256 "9a0739793b50bd6512bad8c4aa12c9374b008494fa402bd2daa25af61d03d877"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
