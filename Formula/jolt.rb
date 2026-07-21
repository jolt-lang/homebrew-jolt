class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.11/joltc-v0.4.11-aarch64-macos.tar.gz"
      sha256 "76630f19d21014c620b6bcc8d05ac8a308827eb55cc2bf75984cccef689aa6ec"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.11/joltc-v0.4.11-x86_64-linux.tar.gz"
      sha256 "8567ce10f18c9915f1cb47393d34b07876ae7d18033a3da9a4b9a3c53e8db752"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
