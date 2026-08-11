class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.0/jolt-v0.7.0-aarch64-macos.tar.gz"
      sha256 "9d7e0d486f0a4206925755121a0116dffdce3d0b28856e29b943ca5eb048f94d"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.0/jolt-v0.7.0-x86_64-linux.tar.gz"
      sha256 "6d31b7529a7150abebe122bbfe0f558440175f31180e38e48b05ad62551bb0cd"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
