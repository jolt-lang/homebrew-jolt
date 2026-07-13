class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.6/joltc-v0.2.6-aarch64-macos.tar.gz"
      sha256 "d7deefdd6d6ba0d5f6d72bb2041e306b62b05ea44f5ebf39cc22e13056e158d1"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.6/joltc-v0.2.6-x86_64-linux.tar.gz"
      sha256 "00622a507727393be290a84516f94d0e49b928ad516d836bd3a1fd71df79744c"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
