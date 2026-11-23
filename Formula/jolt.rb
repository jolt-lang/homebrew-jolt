class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.29/jolt-v0.8.29-aarch64-macos.tar.gz"
      sha256 "14600a1bd52db5f0a0b957c32ca58f5a2470f849771bc34b3daa16f43340aa21"
    end
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.29/jolt-v0.8.29-x86_64-macos.tar.gz"
      sha256 "8443e714ba374e45ef3ba3a6fd1c2037cbbe60dbeefc20591d85ded9ecbfaa52"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.29/jolt-v0.8.29-x86_64-linux.tar.gz"
      sha256 "4050c9472c61df2d647189ba0d55b5e8c946ab56dc407df2080886390efe2297"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
