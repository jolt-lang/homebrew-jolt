class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.12/jolt-v0.8.12-aarch64-macos.tar.gz"
      sha256 "2b10f90af61927bd966ac7be6e21f44568f82f9c060ae9459887229731da44fd"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.12/jolt-v0.8.12-x86_64-linux.tar.gz"
      sha256 "b9c81c36f9c0918ac2de7e6b477378bc26fe743c6be9b5da35f117f2e2181f6a"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
