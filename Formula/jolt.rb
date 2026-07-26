class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.2/jolt-v0.5.2-aarch64-macos.tar.gz"
      sha256 "9d93e3c053b57cbfe6b6cb827c5ae4cc8bb8849f90a9a1abd411ec47b60ab244"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.2/jolt-v0.5.2-x86_64-linux.tar.gz"
      sha256 "24875a07dd8960c77233d61adb9b3a647eb091ab0a0f388193d653367e7af0e5"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
