class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.18/jolt-v0.5.18-aarch64-macos.tar.gz"
      sha256 "75d8f5b7391529106c19d910a0e56265f4b6849b70aeecf0533f3a51f1e95360"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.18/jolt-v0.5.18-x86_64-linux.tar.gz"
      sha256 "ed3772d7fe2f9e7d3efe8b30dc0f1088f15c1e58e48f1babdb45cdec21d562da"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
