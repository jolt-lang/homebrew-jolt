class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.7/jolt-v0.8.7-aarch64-macos.tar.gz"
      sha256 "e504901c10e7f158a836a748f342b3e88ff900ebbe89b06caf43607da2a71904"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.7/jolt-v0.8.7-x86_64-linux.tar.gz"
      sha256 "fec4b404ed1118074e04688d8277967dd66dd2f3fdd3365bb22330908215c944"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
