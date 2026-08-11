class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.1/jolt-v0.7.1-aarch64-macos.tar.gz"
      sha256 "982d5c690d6a9696d8baa60160f8d46b500ed36bac63e61e5f805ae0a38c52c1"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.1/jolt-v0.7.1-x86_64-linux.tar.gz"
      sha256 "7c40ebbf103da561d730dd4c585080850dca701b7513e89e778fc2fe77cdddee"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
