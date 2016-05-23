/*
** Copyright 2016, The CyanogenMod Project
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "log.h"
#include "property_service.h"
#include "util.h"
#include "vendor_init.h"

#define PHONE_INFO "/factory/SSN"

/* Serial number */
#define SERIAL_PROP "ro.serialno"
#define SERIAL_OFFSET 0x00
#define SERIAL_LENGTH 17

/* ProjectID */
#define PRODUCT_PROP "ro.build.product"
#define MODEL_PROP "ro.product.model"
#define DEVICE_PROP "ro.product.device"
#define DESCRIPTION_PROP "ro.build.description"
#define FINGERPRINT_PROP "ro.build.fingerprint"
#define PRODUCT_ID_FILE "/sys/module/intel_mid_sfi/parameters/project_id"
#define ID_LENGTH 2

static int read_file2(const char *fname, char *data, int max_size)
{
    int fd, rc;

    if (max_size < 1)
        return 0;

    fd = open(fname, O_RDONLY);
    if (fd < 0) {
        ERROR("failed to open '%s'\n", fname);
        return 0;
    }

    rc = read(fd, data, max_size -1);
    if ((rc > 0) && (rc < max_size ))
        data[rc] = '\0';
    else
        data[0] = '\0';
    close(fd);

    return 1;
}

static void get_serial()
{
    int ret = 0;
    char const *path = PHONE_INFO;
    char buf[SERIAL_LENGTH + 1];
    prop_info *pi;

    ERROR("%s: ATTEMPTING LOADING OF SSN\n", __func__);
    if(read_file2(path, buf, sizeof(buf))) {
        if (strlen(buf) > 0) {
            pi = (prop_info*) __system_property_find(SERIAL_PROP);
            if(pi)
                ret = __system_property_update(pi, buf,
                        strlen(buf));
            else
                ret = __system_property_add(SERIAL_PROP,
                        strlen(SERIAL_PROP),
                        buf, strlen(buf));
        } else {
            ERROR("%s: FAILED LOADING SSN\n", __func__);
        }
    } else {
        ERROR("%s: Failed to open %s\n", __func__, PHONE_INFO);
    }
}

static void set_props() {
    property_set("ro.product.model", "Z00D");
    property_set("ro.build.fingerprint", "asus/WW_Phone/ASUS_Z00D:5.0.1/LRX22C/WW_Phone-12.16.5.118-20151204:user/release-keys");
    property_set("ro.build.description", "WW_Phone-user 5.0.1 LRX22C WW_Phone-12.16.5.118-20151204 release-keys");
    property_set("ro.product.device", "ASUS_Z00D");
    property_set("ro.build.product", "ze500cl");

}

void vendor_load_properties()
{
    get_serial();
    set_props();
}
