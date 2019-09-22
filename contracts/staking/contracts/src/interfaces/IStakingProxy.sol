/*

  Copyright 2019 ZeroEx Intl.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/

pragma solidity ^0.5.9;


interface IStakingProxy /* is IStaking */
{

    /// @dev Emitted by StakingProxy when a staking contract is attached.
    /// @param newStakingContractAddress Address of newly attached staking contract.
    event StakingContractAttachedToProxy(
        address newStakingContractAddress
    );

    /// @dev Emitted by StakingProxy when a staking contract is detached.
    event StakingContractDetachedFromProxy();

    /// @dev Emitted by StakingProxy when read-only mode is set.
    event ReadOnlyModeSet(
        bool readOnlyMode
    );

    /// @dev Delegates calls to the staking contract, if it is set.
    // solhint-disable no-complex-fallback
    function ()
        external
        payable;

    /// @dev Attach a staking contract; future calls will be delegated to the staking contract.
    /// Note that this is callable only by this contract's owner.
    /// @param _stakingContract Address of staking contract.
    /// @param _wethProxyAddress The address that can transfer WETH for fees.
    ///        Use address in storage if NIL_ADDRESS is passed in.
    /// @param _ethVaultAddress Address of the OperatorRewardVault contract.
    ///        Use address in storage if NIL_ADDRESS is passed in.
    /// @param _rewardVaultAddress Address of the MemberRewardVault contract.
    ///        Use address in storage if NIL_ADDRESS is passed in.
    /// @param _zrxVaultAddress Address of the ZrxVault contract.
    ///        Use address in storage if NIL_ADDRESS is passed in.
    function attachStakingContract(
        address _stakingContract,
        address _wethProxyAddress,
        address _ethVaultAddress,
        address _rewardVaultAddress,
        address _zrxVaultAddress
    )
        external;

    /// @dev Detach the current staking contract.
    /// Note that this is callable only by this contract's owner.
    function detachStakingContract()
        external;
}
