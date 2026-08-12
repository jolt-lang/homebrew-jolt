class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.5/jolt-v0.7.5-aarch64-macos.tar.gz"
      sha256 "f65b597e81cafa99c908115e2ed3898e2bac4edcdabbf4bfc5d291d3e4bbfc0b"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.5/jolt-v0.7.5-x86_64-linux.tar.gz"
      sha256 "1c037bd4897d6f819eda188483234af03164b7f7ef765ecb86703b62a4edef7e"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
