
package com.test_project;
import android.os.Bundle;
import com.reactnativenavigation.NavigationActivity;
import com.facebook.react.ReactActivityDelegate;
import com.facebook.react.ReactRootView;

public class MainActivity extends NavigationActivity {

  

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(null);
  }

  

  public static class MainActivityDelegate extends ReactActivityDelegate {
    public MainActivityDelegate(NavigationActivity activity, String mainComponentName) {
      super(activity, mainComponentName);
    }

    @Override
    protected ReactRootView createRootView() {
      ReactRootView reactRootView = new ReactRootView(getContext());
      // If you opted-in for the New Architecture, we enable the Fabric Renderer.
      reactRootView.setIsFabric(BuildConfig.IS_NEW_ARCHITECTURE_ENABLED);
      return reactRootView;
    }
  }
}
