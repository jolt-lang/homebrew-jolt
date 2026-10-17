class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.23/jolt-v0.8.23-aarch64-macos.tar.gz"
      sha256 "ebcb856554c9ef9dfd866883aa2e65e1a42a347cae15c90e16db49b07e08aa63"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.23/jolt-v0.8.23-x86_64-linux.tar.gz"
      sha256 "90031be43241e61d0788a2f1bbd3da56d8f4324ae9fa87271f9637b43a6071f2"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
