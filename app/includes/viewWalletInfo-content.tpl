<section class="col-sm-4">
<br />
<wallet-balance-drtv></wallet-balance-drtv>
<hr />
<h5 translate="sidebar_TransHistory"> Transaction History: </h5>
<ul class="account-info">
  <li><a href="{{ajaxReq.blockExplorerAddr.replace('[[address]]', wallet.getAddressString())}}" target="_blank">{{ajaxReq.blockExplorerAddr.replace('[[address]]', wallet.getAddressString())}}</a></li>
</ul>
<hr />
<h5 translate="x_Address">Your Address:</h5>
  <div class="qr-code" qr-code="{{wallet.getAddressString()}}" watch-var="wallet" width="100%"></div>
  <h5 ng-show="wallet.type=='default'">
    <span translate="x_PrivKey">Private Key (unencrypted)</span>
    <a class="no-animate" translate="VIEWWALLET_ShowPrivKey" ng-click="showPkey()" ng-show="!pkeyVisible">(show)</a>
  </h5>
  <div class="qr-pkey-container">
    <div class="qr-overlay" ng-show="!pkeyVisible"></div>
    <div ng-show="wallet.type=='default'" class="qr-code" qr-code="{{wallet.getPrivateKeyString()}}" watch-var="wallet" width="100%"></div>
  </div>
</section>

<section class="col-sm-8 view-wallet-content">

<div class="row">
  <h1 class="col-xs-12" translate="VIEWWALLET_SuccessMsg">Success! Here are your wallet details.</h1>
  <div class="col-sm-10">
    <div class="account-help-icon">
      <img src="images/icon-help.svg" class="help-icon" />
      <p class="account-help-text" translate="x_AddessDesc">You may know this as your "Account #" or your "Public Key". It's what you send people so they can send you ETH. That icon is an easy way to recognize your address.</p>
      <h5 translate="x_Address">Your Address:</h5>
    </div>
    <input class="form-control" type="text" ng-value="wallet.getChecksumAddressString()" readonly="readonly">
  </div>
  <div class="col-sm-2 address-identicon-container">
    <div class="addressIdenticon" title="Address Indenticon" blockie-address="{{wallet.getAddressString()}}" watch-var="wallet"></div>
  </div>
</div>

<div ng-show="wallet.type=='default'">
  <div class="account-help-icon">
    <img src="images/icon-help.svg" class="help-icon" />
    <p class="account-help-text" translate="x_PrivKeyDesc">This is the unencrypted text version of your private key, meaning no password is necessary. If someone were to find your unencrypted private key, they could access your wallet without a password. For this reason, encrypted versions are typically recommended.</p>
    <h5>
      <span translate="x_PrivKey">Private Key (unencrypted)</span>
      <a class="no-animate" translate="VIEWWALLET_ShowPrivKey" ng-click="showPkey()" ng-show="!pkeyVisible">(show)</a>
    </h5>
  </div>
  <input class="form-control no-animate" type="password" ng-value="wallet.getPrivateKeyString()" ng-if="!pkeyVisible" readonly="readonly">
  <textarea class="form-control no-animate" type="text" ng-if="pkeyVisible" readonly="readonly">{{wallet.getPrivateKeyString()}}</textarea>
</div>

<div ng-show="wallet.type=='default'">
  <div class="account-help-icon">
    <img src="images/icon-help.svg" class="help-icon" />
    <p class="account-help-text" translate="x_PrintDesc">ProTip: Click print and save this as a PDF, even if you do not own a printer!</p>
    <h5 translate="x_Print">Print Paper Wallet:</h5>
  </div>
  <a class="btn btn-info btn-block" ng-click="printQRCode()" translate="x_Print">Print Paper Wallet</a>
</div>

<div ng-show='showEnc'>
  <div class="account-help-icon">
    <img src="images/icon-help.svg" class="help-icon" />
    <p class="account-help-text" translate="x_KeystoreDesc">This Keystore / JSON file matches the format used by Mist & Geth so you can easily import it in the future. It is the recommended file to download and back up.</p>
    <h5 translate="x_Keystore">Keystore/JSON File (Recommended • Encrypted • Mist/Geth Format)</h5>
  </div>
  <a class="btn btn-info btn-block" href="{{blobEnc}}" download="{{encFileName}}" translate="x_Download"> DOWNLOAD </a>
</div>
