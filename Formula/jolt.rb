class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.1/joltc-v0.2.1-aarch64-macos.tar.gz"
      sha256 "99ed386435a31caf75f2a7a4823f4aa5faa8cc32b171ef2bb20793c086be3aa2"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.2.1/joltc-v0.2.1-x86_64-linux.tar.gz"
      sha256 "eb223bc0e8543ae6575154863dda0788bff7ae4dd7dcdf92d9c192d95ac2bbf7"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
