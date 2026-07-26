class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.1/jolt-v0.5.1-aarch64-macos.tar.gz"
      sha256 "725b01a0ec30a9e787e65e49f8001fbb56a623236de979f4f4e5225b381da340"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.1/jolt-v0.5.1-x86_64-linux.tar.gz"
      sha256 "266c87866019e1bf6b2f59346d926fb506759ca7dde7a3f0d12fb4ef24e32eec"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
