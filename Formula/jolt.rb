class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.12/jolt-v0.7.12-aarch64-macos.tar.gz"
      sha256 "e77a6e83ea545d223edb0f859dd1cb8726b66f9a77e16daf92d20c72ae978dab"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.12/jolt-v0.7.12-x86_64-linux.tar.gz"
      sha256 "2f8cfdf64323a8b201f359fbf0fec9abc6cf4fb1e3666efb1822d9994ae739bb"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
