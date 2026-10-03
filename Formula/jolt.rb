class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.16/jolt-v0.8.16-aarch64-macos.tar.gz"
      sha256 "006b3a88ddb9797e168de40f4b8b6f969b5ab768916536556ccbf039fbb21f57"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.16/jolt-v0.8.16-x86_64-linux.tar.gz"
      sha256 "85d6160b21d63d3a24bd93ed8e427a10f433b421a5ba0279bb4f721591130ff5"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
