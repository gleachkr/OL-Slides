{
  description = "A very basic flake";

  inputs.flake-utils.url  = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils}: flake-utils.lib.eachDefaultSystem (system:
    let pkgs = nixpkgs.legacyPackages.${system};
    in {

      devShell = pkgs.mkShell { 
        buildInputs = [ 
          pkgs.nodePackages.vscode-langservers-extracted
          pkgs.nodePackages.typescript-language-server 
          pkgs.nodePackages.browser-sync
        ]; 
      };
  });
}
