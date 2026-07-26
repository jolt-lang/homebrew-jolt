class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.3/jolt-v0.5.3-aarch64-macos.tar.gz"
      sha256 "ab7702403f21bbad03b8139ad7c9c8db3e6ce535cd84a909be737e87c8fa9ab7"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.3/jolt-v0.5.3-x86_64-linux.tar.gz"
      sha256 "36fd28d45d2792a78673f3200446e946dd986c9174953541144687db41f04cf4"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
