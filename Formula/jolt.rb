class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.7/joltc-v0.1.7-aarch64-macos.tar.gz"
      sha256 "e3c27188a1584687ce9a57c0e68c6b0f2fcbe42a6965ca2767cde5827522e5a0"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.7/joltc-v0.1.7-x86_64-linux.tar.gz"
      sha256 "12d5b080986313786134b71fb4cb17053dd3a664a79230df828590f387785d7f"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
