class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.1/jolt-v0.8.1-aarch64-macos.tar.gz"
      sha256 "0d7744da0133fa1a69886b0d04da41ee88bfa17be59506afe0b66fea8d1a88a6"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.1/jolt-v0.8.1-x86_64-linux.tar.gz"
      sha256 "ddca03c95190a8079c3674482187782796031cf0de685ee29411f08481bc440c"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
