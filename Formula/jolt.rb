class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.18/jolt-v0.7.18-aarch64-macos.tar.gz"
      sha256 "5101002b26cfa14fee6d8095000c818257be9a32f2198b030002fa882f173f91"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.18/jolt-v0.7.18-x86_64-linux.tar.gz"
      sha256 "3c0520ac7fcb1f91cde001beb71445ea83ab13168e9cc1d831cb7970b92bc441"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
