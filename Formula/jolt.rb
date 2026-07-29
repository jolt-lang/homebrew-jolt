class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.12/jolt-v0.5.12-aarch64-macos.tar.gz"
      sha256 "302257029d51bcc357ec2363737d28d0ee594357959c912f851c478fdd8ce278"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.12/jolt-v0.5.12-x86_64-linux.tar.gz"
      sha256 "e41b73446c2158550c8f5d9d9ab7aa15e615ccb8a637c352c7011a6ebcdf96ad"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
