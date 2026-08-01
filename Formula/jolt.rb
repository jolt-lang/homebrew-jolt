class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.17/jolt-v0.5.17-aarch64-macos.tar.gz"
      sha256 "a5d2dd4ceec193e399e97ccae2126551adc7fc120fb0b52c2f353974a49ec239"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.17/jolt-v0.5.17-x86_64-linux.tar.gz"
      sha256 "66568102a3e0ff09ee4f569fdbc3b198a7a2bf6a69cf96fe605136616c45ff51"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
