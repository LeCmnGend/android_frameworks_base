/*
 * Copyright (C) 2015 The Android Open Source Project
 * Copyright (C) 2017-2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.systemui.qs.tiles;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.hardware.usb.UsbManager;
import android.provider.Settings;
import android.net.ConnectivityManager;
import android.service.quicksettings.Tile;

import com.android.internal.logging.nano.MetricsProto.MetricsEvent;
import com.android.systemui.plugins.qs.QSTile.BooleanState;
import com.android.systemui.qs.QSHost;
import com.android.systemui.qs.tileimpl.QSTileImpl;
import com.android.systemui.R;
import com.android.systemui.plugins.ActivityStarter;
import com.android.systemui.statusbar.policy.KeyguardStateController;

import javax.inject.Inject;

/**
 * USB Tether quick settings tile
 */
public class UsbTetherTile extends QSTileImpl<BooleanState> {

    private final Icon mIcon = ResourceIcon.get(R.drawable.ic_qs_usb_tether);

    private static final Intent TETHER_SETTINGS = new Intent().setComponent(new ComponentName(
            "com.android.settings", "com.android.settings.TetherSettings"));

    private final ConnectivityManager mConnectivityManager;

    private boolean mListening;

    private boolean mUsbConnected = false;
    private boolean mUsbTetherEnabled = false;

    private final ActivityStarter mActivityStarter;
    private final KeyguardStateController mKeyguard;

    @Inject
    public UsbTetherTile(QSHost host, ActivityStarter activityStarter, KeyguardStateController keyguardStateController) {
        super(host);
        mConnectivityManager = mContext.getSystemService(ConnectivityManager.class);

        mActivityStarter = activityStarter;
        mKeyguard = keyguardStateController;
        final KeyguardStateController.Callback callback = new KeyguardStateController.Callback() {
            @Override
            public void onKeyguardShowingChanged() {
                refreshState();
            }
        };
        mKeyguard.observe(this, callback);
    }

    public BooleanState newTileState() {
        return new BooleanState();
    }

    @Override
    public void handleSetListening(boolean listening) {
        if (mListening == listening) {
            return;
        }
        mListening = listening;
        if (listening) {
            final IntentFilter filter = new IntentFilter();
            filter.addAction(UsbManager.ACTION_USB_STATE);
            mContext.registerReceiver(mReceiver, filter);
        } else {
            mContext.unregisterReceiver(mReceiver);
        }
    }

    private void handleClickInner() {
        if (mUsbConnected) {
            mConnectivityManager.setUsbTethering(!mUsbTetherEnabled);
        }
    }

    @Override
    protected void handleClick() {
        if (mKeyguard.isMethodSecure() && mKeyguard.isShowing()) {
            mActivityStarter.postQSRunnableDismissingKeyguard(() -> {
                mHost.openPanels();
                handleClickInner();
            });
            return;
        }
        handleClickInner();
    }

    @Override
    public Intent getLongClickIntent() {
        return new Intent(TETHER_SETTINGS);
    }

    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            mUsbConnected = intent.getBooleanExtra(UsbManager.USB_CONNECTED, false);
            if (mUsbConnected && mConnectivityManager.isTetheringSupported()) {
                mUsbTetherEnabled = intent.getBooleanExtra(UsbManager.USB_FUNCTION_RNDIS, false);
            } else {
                mUsbTetherEnabled = false;
            }
            refreshState();
        }
    };

    @Override
    protected void handleUpdateState(BooleanState state, Object arg) {
        state.value = mUsbTetherEnabled;
        state.label = mContext.getString(R.string.quick_settings_usb_tether_label);
        state.icon = mIcon;
        state.state = !mUsbConnected ? Tile.STATE_UNAVAILABLE
                : mUsbTetherEnabled ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE;
    }

    @Override
    public CharSequence getTileLabel() {
        return mContext.getString(R.string.quick_settings_usb_tether_label);
    }

    @Override
    public int getMetricsCategory() {
        return MetricsEvent.SUPERIOR;
    }
}
