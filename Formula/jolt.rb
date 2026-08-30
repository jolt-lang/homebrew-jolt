class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.29/jolt-v0.7.29-aarch64-macos.tar.gz"
      sha256 "2bd2e0a767b7d15fd172e93f9efa66773a1a14871424dbcb8d9381211c44ed5e"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.29/jolt-v0.7.29-x86_64-linux.tar.gz"
      sha256 "34b53756f75aab7a5dc63d2bb6cf565c402024df08cee0b8a5163d82fd3ddb13"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
