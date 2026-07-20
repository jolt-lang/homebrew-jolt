class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.9/joltc-v0.4.9-aarch64-macos.tar.gz"
      sha256 "b90409758af96febee4341500edf0c9cf603e62afbe00a8087e708115a973fd0"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.9/joltc-v0.4.9-x86_64-linux.tar.gz"
      sha256 "9cac4b76803ec700224caed24ef9648299943240dd93b24478a82fa26da30101"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
