class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.8/joltc-v0.2.8-aarch64-macos.tar.gz"
      sha256 "cab750442d8b8a9e6baaaec31f0ecf122ce9413618d88d4b21e71a2d898fdacf"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.8/joltc-v0.2.8-x86_64-linux.tar.gz"
      sha256 "b5707e0146f4740220afd057e12d94b9eebea5b33a6f4abd83046155cf369b48"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
