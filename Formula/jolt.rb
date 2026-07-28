class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.9/jolt-v0.5.9-aarch64-macos.tar.gz"
      sha256 "d1da85ea6c633138cc1abd0e0b8dd158e60d8b8ee699e93e734b6415769b0bde"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.9/jolt-v0.5.9-x86_64-linux.tar.gz"
      sha256 "03a0d3a6015e261d46ce5e2cbf26036e6e262c898343071d0a65f591f274b93b"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
