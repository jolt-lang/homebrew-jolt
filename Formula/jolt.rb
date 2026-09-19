class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.10/jolt-v0.8.10-aarch64-macos.tar.gz"
      sha256 "157d8f936f00d3c69679f3020e9008dd13eebe50f07b08a30762d904e6a3d776"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.10/jolt-v0.8.10-x86_64-linux.tar.gz"
      sha256 "750a455720881a48cec7890f57020581573f6ec22abf8017dd8e2e298a57dca6"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
