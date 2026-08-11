class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.3/jolt-v0.7.3-aarch64-macos.tar.gz"
      sha256 "2959922d84fb14ccfbbefb31e7c7943cc8c377bd061daa98d78c80988a171f5c"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.3/jolt-v0.7.3-x86_64-linux.tar.gz"
      sha256 "86cd579ad5aa574f900c0fb7c4b69c99b2a86f4d81b24968004a2c234fe538d7"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
