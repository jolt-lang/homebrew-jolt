class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.4/jolt-v0.8.4-aarch64-macos.tar.gz"
      sha256 "a9d0456291db13aef74bc45be2cdd4c0b779a1614aacf579ea5bd6a925888280"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.4/jolt-v0.8.4-x86_64-linux.tar.gz"
      sha256 "fe40abe46d145f65395454cbd70f7567b07c81ab9ab504e5613344386c2bdfc8"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
