//-------------------------------------------------------------------------------------------------------
// Copyright (C) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE.txt file in the project root for full license information.
//-------------------------------------------------------------------------------------------------------
package Windows.UI.Xaml.Controls;

public interface IFireEvents {
		void addEventHandler(String eventName, Handle handle);
		void removeEventHandler(String eventName);
}
